
{{- define "go-echo9017b2f8-0526-4250-bee1-987792a45dff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9017b2f8-0526-4250-bee1-987792a45dff.fullname" -}}
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


{{- define "go-echo9017b2f8-0526-4250-bee1-987792a45dff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9017b2f8-0526-4250-bee1-987792a45dff.labels" -}}
helm.sh/chart: {{ include "go-echo9017b2f8-0526-4250-bee1-987792a45dff.chart" . }}
{{ include "go-echo9017b2f8-0526-4250-bee1-987792a45dff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9017b2f8-0526-4250-bee1-987792a45dff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9017b2f8-0526-4250-bee1-987792a45dff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}