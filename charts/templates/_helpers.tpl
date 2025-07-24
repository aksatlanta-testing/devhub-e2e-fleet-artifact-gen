
{{- define "go-echo828fb0a8-a1c1-4655-900f-f78df3fc2eda.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo828fb0a8-a1c1-4655-900f-f78df3fc2eda.fullname" -}}
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


{{- define "go-echo828fb0a8-a1c1-4655-900f-f78df3fc2eda.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo828fb0a8-a1c1-4655-900f-f78df3fc2eda.labels" -}}
helm.sh/chart: {{ include "go-echo828fb0a8-a1c1-4655-900f-f78df3fc2eda.chart" . }}
{{ include "go-echo828fb0a8-a1c1-4655-900f-f78df3fc2eda.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo828fb0a8-a1c1-4655-900f-f78df3fc2eda.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo828fb0a8-a1c1-4655-900f-f78df3fc2eda.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}