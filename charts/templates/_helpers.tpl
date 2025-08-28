
{{- define "go-echo4b5e4130-4215-4fef-abbd-1a23dbc5cd4a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4b5e4130-4215-4fef-abbd-1a23dbc5cd4a.fullname" -}}
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


{{- define "go-echo4b5e4130-4215-4fef-abbd-1a23dbc5cd4a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4b5e4130-4215-4fef-abbd-1a23dbc5cd4a.labels" -}}
helm.sh/chart: {{ include "go-echo4b5e4130-4215-4fef-abbd-1a23dbc5cd4a.chart" . }}
{{ include "go-echo4b5e4130-4215-4fef-abbd-1a23dbc5cd4a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4b5e4130-4215-4fef-abbd-1a23dbc5cd4a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4b5e4130-4215-4fef-abbd-1a23dbc5cd4a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}