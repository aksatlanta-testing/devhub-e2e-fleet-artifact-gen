
{{- define "go-echof58ed115-3da4-4900-add0-557d5ea40f9d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof58ed115-3da4-4900-add0-557d5ea40f9d.fullname" -}}
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


{{- define "go-echof58ed115-3da4-4900-add0-557d5ea40f9d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof58ed115-3da4-4900-add0-557d5ea40f9d.labels" -}}
helm.sh/chart: {{ include "go-echof58ed115-3da4-4900-add0-557d5ea40f9d.chart" . }}
{{ include "go-echof58ed115-3da4-4900-add0-557d5ea40f9d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof58ed115-3da4-4900-add0-557d5ea40f9d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof58ed115-3da4-4900-add0-557d5ea40f9d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}