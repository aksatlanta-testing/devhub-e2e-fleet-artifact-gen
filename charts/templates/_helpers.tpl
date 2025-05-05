
{{- define "go-echo53eb33f9-dd13-49d1-80a6-a378e4ca9dd2.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53eb33f9-dd13-49d1-80a6-a378e4ca9dd2.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo53eb33f9-dd13-49d1-80a6-a378e4ca9dd2.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo53eb33f9-dd13-49d1-80a6-a378e4ca9dd2.labels" -}}
helm.sh/chart: {{ include "go-echo53eb33f9-dd13-49d1-80a6-a378e4ca9dd2.chart" . }}
{{ include "go-echo53eb33f9-dd13-49d1-80a6-a378e4ca9dd2.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo53eb33f9-dd13-49d1-80a6-a378e4ca9dd2.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo53eb33f9-dd13-49d1-80a6-a378e4ca9dd2.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}