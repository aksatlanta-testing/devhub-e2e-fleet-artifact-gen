
{{- define "go-echod8ad8a76-f02d-4fda-842b-b4f85aaf73bd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8ad8a76-f02d-4fda-842b-b4f85aaf73bd.fullname" -}}
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


{{- define "go-echod8ad8a76-f02d-4fda-842b-b4f85aaf73bd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod8ad8a76-f02d-4fda-842b-b4f85aaf73bd.labels" -}}
helm.sh/chart: {{ include "go-echod8ad8a76-f02d-4fda-842b-b4f85aaf73bd.chart" . }}
{{ include "go-echod8ad8a76-f02d-4fda-842b-b4f85aaf73bd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod8ad8a76-f02d-4fda-842b-b4f85aaf73bd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod8ad8a76-f02d-4fda-842b-b4f85aaf73bd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}