
{{- define "go-echobcaf8464-4c9f-4ea1-9bdd-5f3de70c30f4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcaf8464-4c9f-4ea1-9bdd-5f3de70c30f4.fullname" -}}
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


{{- define "go-echobcaf8464-4c9f-4ea1-9bdd-5f3de70c30f4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobcaf8464-4c9f-4ea1-9bdd-5f3de70c30f4.labels" -}}
helm.sh/chart: {{ include "go-echobcaf8464-4c9f-4ea1-9bdd-5f3de70c30f4.chart" . }}
{{ include "go-echobcaf8464-4c9f-4ea1-9bdd-5f3de70c30f4.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobcaf8464-4c9f-4ea1-9bdd-5f3de70c30f4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobcaf8464-4c9f-4ea1-9bdd-5f3de70c30f4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}