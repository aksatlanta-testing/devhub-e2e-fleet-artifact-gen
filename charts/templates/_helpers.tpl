
{{- define "go-echof3eeca2e-0f26-4cab-a382-2333a5a43b49.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3eeca2e-0f26-4cab-a382-2333a5a43b49.fullname" -}}
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


{{- define "go-echof3eeca2e-0f26-4cab-a382-2333a5a43b49.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3eeca2e-0f26-4cab-a382-2333a5a43b49.labels" -}}
helm.sh/chart: {{ include "go-echof3eeca2e-0f26-4cab-a382-2333a5a43b49.chart" . }}
{{ include "go-echof3eeca2e-0f26-4cab-a382-2333a5a43b49.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof3eeca2e-0f26-4cab-a382-2333a5a43b49.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof3eeca2e-0f26-4cab-a382-2333a5a43b49.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}