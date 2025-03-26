
{{- define "go-echo18c5a369-a0ef-49c2-b640-e52ae62eb499.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18c5a369-a0ef-49c2-b640-e52ae62eb499.fullname" -}}
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


{{- define "go-echo18c5a369-a0ef-49c2-b640-e52ae62eb499.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18c5a369-a0ef-49c2-b640-e52ae62eb499.labels" -}}
helm.sh/chart: {{ include "go-echo18c5a369-a0ef-49c2-b640-e52ae62eb499.chart" . }}
{{ include "go-echo18c5a369-a0ef-49c2-b640-e52ae62eb499.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo18c5a369-a0ef-49c2-b640-e52ae62eb499.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo18c5a369-a0ef-49c2-b640-e52ae62eb499.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}