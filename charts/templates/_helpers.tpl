
{{- define "go-echoa1a7de75-5da9-4548-bfb1-cb6d206d732e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1a7de75-5da9-4548-bfb1-cb6d206d732e.fullname" -}}
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


{{- define "go-echoa1a7de75-5da9-4548-bfb1-cb6d206d732e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa1a7de75-5da9-4548-bfb1-cb6d206d732e.labels" -}}
helm.sh/chart: {{ include "go-echoa1a7de75-5da9-4548-bfb1-cb6d206d732e.chart" . }}
{{ include "go-echoa1a7de75-5da9-4548-bfb1-cb6d206d732e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa1a7de75-5da9-4548-bfb1-cb6d206d732e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa1a7de75-5da9-4548-bfb1-cb6d206d732e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}