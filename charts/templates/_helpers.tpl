
{{- define "go-echof47bb55d-5bd1-42a0-8e0c-1c786e2cdada.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof47bb55d-5bd1-42a0-8e0c-1c786e2cdada.fullname" -}}
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


{{- define "go-echof47bb55d-5bd1-42a0-8e0c-1c786e2cdada.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof47bb55d-5bd1-42a0-8e0c-1c786e2cdada.labels" -}}
helm.sh/chart: {{ include "go-echof47bb55d-5bd1-42a0-8e0c-1c786e2cdada.chart" . }}
{{ include "go-echof47bb55d-5bd1-42a0-8e0c-1c786e2cdada.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof47bb55d-5bd1-42a0-8e0c-1c786e2cdada.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof47bb55d-5bd1-42a0-8e0c-1c786e2cdada.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}