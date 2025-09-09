
{{- define "go-echod83162b9-416c-4ebf-9a46-3d34e7dd381b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod83162b9-416c-4ebf-9a46-3d34e7dd381b.fullname" -}}
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


{{- define "go-echod83162b9-416c-4ebf-9a46-3d34e7dd381b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod83162b9-416c-4ebf-9a46-3d34e7dd381b.labels" -}}
helm.sh/chart: {{ include "go-echod83162b9-416c-4ebf-9a46-3d34e7dd381b.chart" . }}
{{ include "go-echod83162b9-416c-4ebf-9a46-3d34e7dd381b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod83162b9-416c-4ebf-9a46-3d34e7dd381b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod83162b9-416c-4ebf-9a46-3d34e7dd381b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}