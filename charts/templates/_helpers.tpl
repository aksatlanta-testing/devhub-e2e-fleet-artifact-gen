
{{- define "go-echoe08f9e35-3d0d-4792-a35a-79a80e77d82a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe08f9e35-3d0d-4792-a35a-79a80e77d82a.fullname" -}}
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


{{- define "go-echoe08f9e35-3d0d-4792-a35a-79a80e77d82a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe08f9e35-3d0d-4792-a35a-79a80e77d82a.labels" -}}
helm.sh/chart: {{ include "go-echoe08f9e35-3d0d-4792-a35a-79a80e77d82a.chart" . }}
{{ include "go-echoe08f9e35-3d0d-4792-a35a-79a80e77d82a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe08f9e35-3d0d-4792-a35a-79a80e77d82a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe08f9e35-3d0d-4792-a35a-79a80e77d82a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}