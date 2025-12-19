
{{- define "go-echoe77c3968-252b-4d10-b853-7abfe7f0340c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe77c3968-252b-4d10-b853-7abfe7f0340c.fullname" -}}
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


{{- define "go-echoe77c3968-252b-4d10-b853-7abfe7f0340c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe77c3968-252b-4d10-b853-7abfe7f0340c.labels" -}}
helm.sh/chart: {{ include "go-echoe77c3968-252b-4d10-b853-7abfe7f0340c.chart" . }}
{{ include "go-echoe77c3968-252b-4d10-b853-7abfe7f0340c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe77c3968-252b-4d10-b853-7abfe7f0340c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe77c3968-252b-4d10-b853-7abfe7f0340c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}