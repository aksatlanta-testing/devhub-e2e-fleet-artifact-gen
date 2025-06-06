
{{- define "go-echo908e6434-6d98-4ca9-b9c5-bc804fd1e7fc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo908e6434-6d98-4ca9-b9c5-bc804fd1e7fc.fullname" -}}
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


{{- define "go-echo908e6434-6d98-4ca9-b9c5-bc804fd1e7fc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo908e6434-6d98-4ca9-b9c5-bc804fd1e7fc.labels" -}}
helm.sh/chart: {{ include "go-echo908e6434-6d98-4ca9-b9c5-bc804fd1e7fc.chart" . }}
{{ include "go-echo908e6434-6d98-4ca9-b9c5-bc804fd1e7fc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo908e6434-6d98-4ca9-b9c5-bc804fd1e7fc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo908e6434-6d98-4ca9-b9c5-bc804fd1e7fc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}