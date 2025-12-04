
{{- define "go-echoa7fea8e3-f36c-44d7-807e-e7942ee0d072.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7fea8e3-f36c-44d7-807e-e7942ee0d072.fullname" -}}
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


{{- define "go-echoa7fea8e3-f36c-44d7-807e-e7942ee0d072.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa7fea8e3-f36c-44d7-807e-e7942ee0d072.labels" -}}
helm.sh/chart: {{ include "go-echoa7fea8e3-f36c-44d7-807e-e7942ee0d072.chart" . }}
{{ include "go-echoa7fea8e3-f36c-44d7-807e-e7942ee0d072.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa7fea8e3-f36c-44d7-807e-e7942ee0d072.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa7fea8e3-f36c-44d7-807e-e7942ee0d072.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}