
{{- define "go-echo2b6018a5-379f-48d7-af1b-6bfd5f5c3dbc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b6018a5-379f-48d7-af1b-6bfd5f5c3dbc.fullname" -}}
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


{{- define "go-echo2b6018a5-379f-48d7-af1b-6bfd5f5c3dbc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2b6018a5-379f-48d7-af1b-6bfd5f5c3dbc.labels" -}}
helm.sh/chart: {{ include "go-echo2b6018a5-379f-48d7-af1b-6bfd5f5c3dbc.chart" . }}
{{ include "go-echo2b6018a5-379f-48d7-af1b-6bfd5f5c3dbc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2b6018a5-379f-48d7-af1b-6bfd5f5c3dbc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2b6018a5-379f-48d7-af1b-6bfd5f5c3dbc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}