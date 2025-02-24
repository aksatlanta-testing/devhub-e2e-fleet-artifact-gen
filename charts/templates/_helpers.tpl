
{{- define "go-echo6c4ba76a-10be-4762-ae17-00a6c05c366e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6c4ba76a-10be-4762-ae17-00a6c05c366e.fullname" -}}
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


{{- define "go-echo6c4ba76a-10be-4762-ae17-00a6c05c366e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6c4ba76a-10be-4762-ae17-00a6c05c366e.labels" -}}
helm.sh/chart: {{ include "go-echo6c4ba76a-10be-4762-ae17-00a6c05c366e.chart" . }}
{{ include "go-echo6c4ba76a-10be-4762-ae17-00a6c05c366e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6c4ba76a-10be-4762-ae17-00a6c05c366e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6c4ba76a-10be-4762-ae17-00a6c05c366e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}