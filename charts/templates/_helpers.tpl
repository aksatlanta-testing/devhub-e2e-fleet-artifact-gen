
{{- define "go-echo329a41e8-fae2-4af1-be31-d92176daf5bb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo329a41e8-fae2-4af1-be31-d92176daf5bb.fullname" -}}
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


{{- define "go-echo329a41e8-fae2-4af1-be31-d92176daf5bb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo329a41e8-fae2-4af1-be31-d92176daf5bb.labels" -}}
helm.sh/chart: {{ include "go-echo329a41e8-fae2-4af1-be31-d92176daf5bb.chart" . }}
{{ include "go-echo329a41e8-fae2-4af1-be31-d92176daf5bb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo329a41e8-fae2-4af1-be31-d92176daf5bb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo329a41e8-fae2-4af1-be31-d92176daf5bb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}